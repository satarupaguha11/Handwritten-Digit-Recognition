function [accuracy]=knn(k,feature_train,feature_test,BW_train,BW_test,label_train,label_test)

%initializing
sizeDataTrain=size(BW_train,1);
sizeDataTest=size(BW_test,1);
labels=zeros(1,k);
correct=0;
incorrect=0;
confusion=zeros(10);

for i=1:sizeDataTest

    difference=zeros(1,sizeDataTrain);
	%computing euclidean distance
    for j=1:sizeDataTrain
        difference(j)=sum((feature_train(j,:)-feature_test(i,:)).^2);
    end
	%sorting the difference
    [~,sortedIndex] = sort(difference,'ascend'); 
     
    for j=1:k
        labels(j)=label_train(sortedIndex(j),1);
    end
	%taking majority voting
    lbl=mode(single(labels));
	
	%checking labels and putting into correct/incorrect bins
    if label_test(i)==lbl
        correct=correct+1;
    else
        incorrect=incorrect+1;
    end
	
%computing values for the confusion matrix
%  	x=label_test(i);
%  	y=lbl;
%  	confusion(x,y)=confusion(x,y)+1;
end

% disp('Predicted Label')
% disp(lbl)
% disp('Actual Label')
% disp(label_test(i))

%computing accuracy
accuracy=(correct/sizeDataTest)*100;
error=(incorrect/sizeDataTest)*100;

end
