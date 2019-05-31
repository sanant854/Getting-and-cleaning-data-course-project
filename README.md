---
title: "README"
author: "Anant Sharma"
date: "5/31/2019"
output: html_document
---

In the first phase of the script activitylabels and features are extracted from the data. Then the required features are extracted from all the features that are mean and standard deviation.Then the script takes extracts the train data set and then it's labels and subject, and all of them are column binded. Similar steps are performed for the test dataset.After getting both train and test dataset, we rowbind both datasets to get a whole dataset. The the activity ad subjects are converted to factors and appropiate columnn names are given to the dataset.At last the script takes out the mean of the subject and acivity by melting and casting process.


