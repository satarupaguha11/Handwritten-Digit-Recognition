/**********************************************************************************************************************************************************/
I have implemented the Hand written digit Recognizer in the following way-
1. Reading and Preprocessing of the image
2. Feature Extraction
3. KNN Classification

First in order to read the images we invoke following functions from matlab:

[BW_train, label_train] = readDigitData_bw('train',per_train);
[BW_test, label_test] = readDigitData_bw('test',per_test);

This is for reading the image matrices in binarized and cleaned form.
trainData/testData are matrices of size M*N where M is number of samples and N is dimensionality of image. In this case since images
are of fixed size 28*28, N=784. M depends on what % of random data you are taking. trainLabel/testLabel are the class labels for each M samples, thus
of size M*1 with entry 0-9. per_train/per_test are the percentages of train/test samples we want to read.

Next we extract the features by invoking the following functions from matlab:

[feature_train] = feature_x(BW_train);
[feature_test] = feature_x(BW_test);

feature_train/feature_test are matrices of size M*N where M is the number of samples and N is the size of the feature vector. BW_train/BW_test are the 
image matrices that we get as output from the readDigitData_bw() function. The name of the function is feature_x() where x stands for a specific feature name. In our
case, x can take the following values-
- template
- histogramProjection
- zoning
- endpoints
- gradientHistogram

Finally, we invoke the function for K-Nearest Neighbor Classification by sending these feature vectors, the labels and the value for k as parameters. Here is an example of invoking the function
for 5-NN:

[accuracy,error,confusion]=knn(5,feature_train,feature_test,BW_train,BW_test,label_train,label_test);

accuracy is the percentage of correctly classified samples among all the input samples. Similarly, error is the percentage of misclassified samples among all the
input samples. The function also computes the confusion matrix. It is a 10x10 matrix showing the percentage of correctly
classified as well as misclassified samples.

**********************************************************************************************************************************************************/


