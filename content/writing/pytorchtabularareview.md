



---
date: 2024-07-16
featured_image: "https://cdn-images-1.medium.com/max/1024/0*O0ONERsDrEvzpYW8"
tags: ["machine-learning","machine-learning-tools","pytorch","tutorial","programming"]
title: "PyTorch Tabular: A Review"
disable_share: false
---
      
#### 
 An overview for getting up and running quickly and avoiding confusion



 From time to time, we all find ourselves considering whether to try out new tooling or experiment with a package, and there’s some risk involved in that. What if the tool doesn’t accomplish what I need, or takes days to get running, or requires complex knowledge I don’t have? Today I’m sharing a simple review of my own experience getting a model up and running using PyTorch Tabular, with code examples that should help other users considering it to get going quickly with a minimum of fuss.




 This project began with a pretty high dimensionality CatBoost model, a supervised learning use case with multi-class classification outcome. The dataset has about 30 highly imbalanced classes, which I’ll describe in more detail in a future post. I wanted to try applying a neural network to the same use case, to see what changes in performance I might have, and I came across PyTorch Tabular as a good option. There are of course other alternatives for applying NNs to tabular data, including using base PyTorch yourself, but having a layer on top designed to accommodate your specific problem case often makes things easier and quicker for development. PyTorch Tabular keeps you from having to think about things like how to convert your dataframe to tensors, and gives you a straightforward access point to model customizations.



### 
 Getting Started



 The documentation at
 <https://pytorch-tabular.readthedocs.io/en/latest/>
 is pretty easy to read and get into, although the main page points you to the development version of the docs, so keep that in mind if you have installed from pypi.




 I use poetry to manage my working environments and libraries, and poetry and PyTorch are known to not get along great all the time, so that’s also a consideration. It definitely took me a few hours to get everything installed and working smoothly, but that’s not the fault of the PyTorch Tabular developers.




 As you may have guessed, this is all optimized for tabular data, so I am bringing my engineered features dataset in pandas format. As you’ll see later on, I can just dump dataframes directly into the training function with no need to reformat, provided my fields are all numeric or boolean.



### 
 Setup



 When you begin structuring your code, you’ll be creating several objects that the PyTorch Tabular training function requires:



* **DataConfig** 
 : prepares the dataloader, including setting up your parallelism for loading.
* **TrainerConfig** 
 : sets batch sizes and epoch numbers, and also lets you determine what processor you’ll use, if you do/don’t want to be on GPU for example.
* **OptimizerConfig** 
 : Allows you to add whatever optimizer you might like, and also a learning rate scheduler, and parameter assignments for each. I didn’t end up customizing this for my use case, it
 [defaults to](https://pytorch-tabular.readthedocs.io/en/latest/tutorials/02-Exploring%20Advanced%20Features%20with%20PyTorch%20Tabular/#3-optimizerconfig) 
 Adam .
* **LinearHeadConfig** 
 : lets you create the model head if you want to customize that, I didn’t need to add anything special here.
* Then you’ll also create a model config, but the base class will differ depending on what kind of model you intend to make. I used the basic CategoryEmbeddingModelConfig for mine, and this is where you’ll assign all the model architecture items such as layer sizes and order, activation function, learning rate, and metrics.



```
data_config = DataConfig(  
    target=[target_col],  
    continuous_cols=features,  
    num_workers=0,  
)  
trainer_config = TrainerConfig(  
    batch_size=1024,   
    max_epochs=20,   
    accelerator="gpu")  
  
optimizer_config = OptimizerConfig()  
  
head_config = LinearHeadConfig(  
    layers="",  # No additional layer in head, just a mapping layer to output_dim  
    dropout=0.0,  
    initialization="kaiming",   
).__dict__  # model config requires dict  
  
model_config = CategoryEmbeddingModelConfig(  
    task="classification",  
    layers="1024-512-512",    
    activation="LeakyReLU",   
    head="LinearHead",  
    head_config=head_config,  
    learning_rate=1e-3,  
[METRICS ARGUMENTS COME NEXT]
```


 Metrics were a little confusing to assign in this section, so I’ll stop and briefly explain. I wanted several different metrics to be visible during training, and in this framework that requires passing several lists for different arguments.




```
metrics=["f1_score", "average_precision", "accuracy", "auroc"],  
metrics_params=[  
    {"task": "multiclass", "num_classes": num_classes},  
    {"task": "multiclass", "num_classes": num_classes},  
    {},  
    {},  
],  # f1_score and avg prec need num_classes and task identifier  
metrics_prob_input=[  
    True,  
    True,  
    False,  
    True,  
],  # f1_score, avg prec, auroc need probability scores, while accuracy doesn't
```


 Here you can see that I’m returning four metrics, and they each have different implementation requirements, so each list represents the same four metrics and their attributes. For example, average precision needs parameters that indicate that this is a multiclass problem, and it needs to be fed the number of classes involved. It also calls for a probability result instead of raw model outputs, unlike accuracy.




 Once you’ve gotten all of this specified, things are pretty easy- you just pass each object into the TabularModel module.




```
tabular_model = TabularModel(  
    data_config=data_config,  
    model_config=model_config,  
    optimizer_config=optimizer_config,  
    trainer_config=trainer_config,  
    verbose=True,  
)
```


 And you’re ready to train!



### 
 Training



 It’s quite easy to set up training once you have train, test, and validation sets created.




```
tabular_model.fit(train=train_split_df, validation=val_split_df)  
result = tabular_model.evaluate(test_split_df)
```


 Training with verbosity on will show you a nice progress bar and keep you informed as to what batch and epoch you’re on. It may tell you, if you’re not using parallelism in your data loader, that there is a data loading bottleneck that you could improve by adding more workers — it’s up to you whether this is of interest, but because my inference job will have a very sparse environment I opted to not have parallelism in my data loader.




 Once the training is complete, you can save the model in two different ways — one is as a PyTorch Tabular output, so usable for loading to fine tune or to use for inference in an environment where PyTorch Tabular is available. The other is as an inference-only version, such as a base PyTorch model, which I found very valuable because I needed to use the model object in a much more bare-bones environment for production.




```
tabular_model.save_model(  
  f"data/models/tabular_version_{model_name}"  
 ) # The PyTorch Tabular version  
  
tabular_model.save_model_for_inference(  
  f"data/models/{model_name}", kind="pytorch"  
 ) # The base PyTorch version
```


 There are some other options available for the save\_model\_for\_inference method that you can read about in the docs. Note also that the PyTorch Tabular model object can’t be transferred from CPU to GPU or vice versa on load- you’re going to have to stay on the same compute you used for training, unless you save your model as a PyTorch model object.



### 
 Inference



 Reloading the model for inference processes later I found really required having both of these objects saved, however, because the PyTorch Tabular model outputs a file called datamodule.sav which is necessary to consistently format your inference data before passing to the model. You could probably put together a pipeline of your own to feed into the model, but I found that to be a much more tedious prospect than just using the file as directed by the documentation. (Note, also, that this file can be rather large- mine turned out over 100mb, and I opted to store it separately rather than just place it with the rest of the code for deployment.)




 In PyTorch Tabular there are built in helpers for inference, but I found that getting my multi-class predictions out with the appropriate labels and in a cleanly useful format required pulling out some of the helper code and rewriting it in my own codebase. For non-multiclass applications, this might not be necessary, but if you do end up going that way,
 [this is the script I adapted from](https://github.com/manujosephv/pytorch_tabular/blob/main/src/pytorch_tabular/tabular_model.py#L1226) 
 .




 This is how the inference process then looks in code, with feature engineering etc omitted. (This runs in Docker on AWS Lambda.)




```
model_obj = torch.load("classifier_pytorch")  
datamodule = joblib.load("datamodule.sav")  
  
...  
  
  
inference_dataloader = datamodule.prepare_inference_dataloader(  
  self.processed_event[pytorch_feature_list], batch_size=256  
)  
  
task = "classification"  
  
point_predictions = []  
for batch in tqdm(inference_dataloader, desc="Generating Predictions..."):  
    for k, v in batch.items():  
        print("New Batch")  
        if isinstance(v, list) and (len(v) == 0):  
            continue  
        batch[k] = v.to(pytorch_model.device)  
    y_hat, ret_value = pytorch_model.predict(batch, ret_model_output=True)  
    point_predictions.append(y_hat.detach().cpu())
```


 After this point, the predictions are formatted and softmax applied to get the probabilities of the different classes, and I can optionally reattach the predictions to the original dataset for evaluation purposes later.



### 
 Conclusions



 Overall, I was really pleased with how PyTorch Tabular works for my use case, although I’m not sure whether I’m going to end up deploying this model to production. My biggest challenges were ensuring that my training process was properly designed so that the inference task (mainly the dataloader) would work efficiently in my production environment, but once I resolved that things were fine. Frankly, not having to think much about formatting tensors was worth the time, too!




 So, if you want to try adapting a model from classical frameworks like CatBoost or LightGBM, I’d recommend giving PyTorch Tabular a try—if nothing else, it should be pretty quick to get up and running, so your experimentation turnaround won’t be too tedious. Next time, I’ll write about what exactly I was using PyTorch Tabular for, and describe performance metrics for the same underlying problem comparing CatBoost at PyTorch.




 Read more of my work at
 [www.stephaniekirmer.com](http://www.stephaniekirmer.com) 
 .



### 
 Further Reading


* [Exploring Advanced Features with PyTorch Tabular](https://pytorch-tabular.readthedocs.io/en/latest/tutorials/02-Exploring%20Advanced%20Features%20with%20PyTorch%20Tabular/)
* [Supervised Models](https://pytorch-tabular.readthedocs.io/en/latest/models/)
* [Imbalanced classification - PyTorch Tabular](https://pytorch-tabular.readthedocs.io/en/latest/tutorials/06-Imbalanced%20Classification/)





---



[PyTorch Tabular: A Review](https://towardsdatascience.com/pytorch-tabular-a-review-b99abc663dbe) 
 was originally published in
 [Towards Data Science](https://towardsdatascience.com) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



