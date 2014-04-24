function [feature]=feature_template(BW_data)

%This function will return feature which is M*N matrix where M is the
%number of image samples and N is the dimension of the feature vector

%initializing
sizeData=size(BW_data,1);
feature=zeros(sizeData,784);
%computing feature vector
for i=1:sizeData
    feature(i,:)=BW_data(i,:);
end
end
