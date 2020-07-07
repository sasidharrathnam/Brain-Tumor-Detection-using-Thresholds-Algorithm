img=imread('1.jpg');
ig=rgb2gray(img);
ig3=imadjust(ig); %enhancing image

threshold=50;
[m,n]=size(ig3); 
ithresh=zeros(m,n); %set all values to 0's in matrix
for i=1:m
    for j=1:n
        if(ig3(i,j)>threshold) 
            ithresh(i,j)=1;
        else
            ithresh(i,j)=0;
        end
    end
end

l=graythresh(ig3); 
disp(l);

ss=strel('disk',3); %to use dilation and erosion
i1=imerode(ithresh,ss); %erosion
i2=imdilate(i1,ss); %dilation

subplot(2,4,1),imshow(img),title('Original');
subplot(2,4,2),imshow(ig3),title('After Enhancement');
subplot(2,4,3),imshow(ithresh),title('After Thresholding');
subplot(2,4,4),imshow(i1),title('After Erosion');
subplot(2,4,5),imshow(i2),title('After Dilation');
figure,imhist(ig3);

