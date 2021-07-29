function [stretchImg] = stretching(img)
%对RGB通道分别进行全局拉伸
stretchImg=double(img);
for k = 1:3   %只对红绿进行拉伸试试？
   [height,width] = size(stretchImg(:,:,k)); 
   Max_channel = max(max(stretchImg(:,:,k)));
   Min_channel = min(min(stretchImg(:,:,k)));
   for i = 1:height
      for j = 1:width
         stretchImg(i,j,k) = (stretchImg(i,j,k) - Min_channel) * (255 - 0)/ ...
                             (Max_channel - Min_channel) + 0;             
      end
   end
end
end

