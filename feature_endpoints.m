%Finding no. of corners for all the 4*4 subimages

function [numberOfCorner] = feature_endpoints(BW_data)

%This function will return feature which is M*N matrix where M is the
%number of image samples and N is the dimension of the feature vector.

%initializing
size_data=size(BW_data,1);
numberOfCorner=zeros(size_data,16);
A=zeros(1,7,7);

for k=1:size_data
    disp(k)
    l=1;
    for i=1:7:27
        for j=1:7:27
            A=BW_data(k,(i:i+6),(j:j+6)); 
            %reshaping
            reshapeInputImage = reshape(A,7,7); 
            %thinning
            thinImage = bwmorph(reshapeInputImage,'thin','inf');
            %computing end points
            cornerCoordinates = corner(thinImage);
            [a b]=size(cornerCoordinates);
            numberOfCorner(k,l)=a;
            l=l+1;

        end
    end
end

end
