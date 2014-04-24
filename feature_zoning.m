%Calculate number of white pixels in each subimage

function [feature] = feature_zoning(BW_data)

%This function will return feature which is M*N matrix where M is the
%number of image samples and N is the dimension of the feature vector.

%initializing
size_data=size(BW_data,1);
feature=zeros(size_data,49);

%divide into 4x4 image
A=zeros(1,4,4);				

for k=1:size_data
    l=1;
    for i=1:4:27
        for j=1:4:27
            A=BW_data(k,(i:i+3),(j:j+3));	
            feature(k,l)=nnz(A);			%compute non zero element for each subimage
            l=l+1;
        end
    end
end
