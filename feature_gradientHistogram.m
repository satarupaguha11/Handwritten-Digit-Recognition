%This function computes the gradient histogram

function [ feature ] = feature_gradientHistogram( BW_data )

	size_data=size(BW_data,1);
    for i=1:size_data
	
    feature=zeros(size_data,14);    
    processedImage=reshape(BW_data(i,:),28,28);
    
    sobelX=[-1 -2 -1;0 0 0;1 2 1];
    sobelY=[-1 0 1;-2 0 2;-1 0 1];
    gX=filter2(sobelX,processedImage,'same');
    gY=filter2(sobelY,processedImage,'same');
    gradient(1,:)=gX(:);
    gradient(2,:)=gY(:);
    
    for i=1:size(gradient,2)
        magnitudeGrad(i)=norm(gradient(:,i));
        directionGrad(i)=atand(gradient(2,i)/gradient(1,i));
        mag=hist(magnitudeGrad,5);
        dir=hist(directionGrad,9);
        feature(i,:)=[mag dir];
    
    end
    

end
