function [feature] = feature_histogramProjection(BW_data)

%This function will return feature which is M*N matrix where M is the
%number of image samples and N is the dimension of the feature vector.

%initializing
size_data=size(BW_data,1);
h_sum=zeros(size_data,28);
v_sum=zeros(size_data,28);

for i=1:size_data
    disp(i)
    for j=1:28
		%computing horizontal sum for all the columns
        h_sum(i,j)=nnz(BW_data(i,j,:));
    end
    for k=1:28
		%computing vertical sum for all the rows
        v_sum(i,k)=nnz(BW_data(i,:,k));
    end
end


feature=zeros(size_data,56);


for i=1:size_data
    for j=1:28
		%concatenating the horizontal and vertical sums
        feature(i,j)=h_sum(i,j);
        feature(i,j+28)=v_sum(i,j);
    end
end
