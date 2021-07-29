function [Irgb] = LABStretching(img)
%将图像由rgb转换到lab模型，并进行拉伸
I = uint8(img);
[height,width] = size(I(:,:,1));
Ilab = rgb2lab(I);
%Ilab = rgb2lab(I,'ColorSpace','linear-rgb');
L = Ilab(:,:,1);
a = Ilab(:,:,2);
b = Ilab(:,:,3); 
% figure;
% imshow(Ilab,[]);

%绘制拉伸前的L图像
% histimg = figure;
% [n,xout]=hist(reshape(L,[],1),100); 
% n = n/(height*width);
% plot(xout,n,'.','MarkerSize',15);
% axis([0,100,-inf,inf]);
% legend('L');
% ylabel('Frequency');
% %set(gca,'YTick',[0:0.01:0.06]);
% saveas(histimg,strcat('output\Lhist2.png'));

img_l_stretching = global_stretching_l(L,height,width);
img_a_stretching = global_stretching_ab(a,height,width);
img_b_stretching = global_stretching_ab(b,height,width);
imglab = cat(3,img_l_stretching,img_a_stretching,img_b_stretching);

%绘制拉伸后的L图像
% [n,xout]=hist(reshape(img_l_stretching,[],1),100); 
% n = n/(height*width);
% plot(xout,n,'.','MarkerSize',15);
% axis([0,100,-inf,inf]);
% legend('L');
% ylabel('Frequency');
% %set(gca,'YTick',[0:0.01:0.06]);
% saveas(histimg,strcat('output\Lhist3.png'));

% imglab = cat(3,img_l_stretching,a,b);
Irgb = lab2rgb(imglab);
end

function [Iabs] = global_stretching_ab(abchannel,height,width)
Iabs = zeros(height,width,'double');
for i = 1:height
   for j = 1:width
      output = abchannel(i,j) * (1.3^(1 - abs(abchannel(i,j)/128)));
      Iabs(i,j) = output;
   end
end
end

function [Ils] = global_stretching_l(lchannel,height,width)
Ils = zeros(height,width);
length = height * width;
lch = reshape(lchannel,1,[]);  %转换成1行向量
lch = sort(lch);               %进行排序
rang = uint16(length/100);     %去掉前后1%的数值
lchFlip = fliplr(lch);         %反向排序
I_min = lch(rang);             %取出设定的最大最小值
I_max = lchFlip(rang);
% I_min = min(min(lchannel));
% I_max = max(max(lchannel));
for i = 1:height
   for j = 1:width
       if lchannel(i,j) < I_min
           Ils(i,j) = 0;
       elseif lchannel(i,j) > I_max
           Ils(i,j) = 100;
       else
           output = (lchannel(i,j) - I_min) * (100/(I_max - I_min));
           Ils(i,j) = output;    
       end
   end
end
end