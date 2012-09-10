clc
clear all

%% generate gabor filters
pCount = 4;
rot = [90 -45 0 45];%%%%%
RF_siz    = 21;
div = [4:-.05:3.2];
Div = div(8);

filter = get_filter_gray(RF_siz, rot, Div,pCount);

% phase = {'0\circ','90\circ','180\circ','270\circ'};
% figure;% show 4 phases at one orientation
% for pp = 1:numel(filter)
%     subplot(2,2,pp);
%     imagesc(filter{pp}(:,:,1));title(phase{pp});
%     axis image;axis off;colormap gray
% end
%filter:9*9*2*4;filters:9*9*3*32



im = imread('C:\Users\pencil\Desktop\eye\Frame2.jpg');
im = imresize(im,0.2);

mu = mean(im);
Dm = bsxfun(@minus,im,mu);
error_ellipse(cov(Dm),'conf',0.95,'mu',mu);
hold on;
plot(D(:,1),D(:,2),'r*');



if max(im(:))>1
    imscr = double(im)/255;
else
    imscr = im;
end
% imscr = rgb2gray(imscr);
% imscr = imscr * 2 -1;  %stick to [-1,1]

[mm,nn] = size(imscr);



%% filtering
USECONV2 = 1;
g = zeros(mm,nn,length(rot),pCount);

for pp = 1:pCount
    for ii = 1:length(rot)
        
        if ~USECONV2
            g(:,:,ii,pp) = abs(imfilter(imscr,filter{pp}(:,:,ii),'symmetric','same','corr'));
        else
            g(:,:,ii,pp) = abs(conv2padded(imscr, filter{pp}(:,:,ii)));
        end

    end
end
% 
% figure;
% pp = 1; 
% for jj = 1:length(rot)
%     subplot(2,2,jj); 
%     imagesc(g(:,:,ii,pp)); 
%     axis image; axis off;
%     colorbar('SouthOutside');
% end

% figure; imagesc(max(g(:,:,:,1),[],3));axis image;axis off;

%% energy response
g_energy = sqrt(sum(g.^2,4));
% % % g_energy = sum(g,4) ./ pCount;
% figure; imagesc(max(g_energy,[],3));axis image;axis off;


%% normlization
k = 1;
sigma = 0.225;
g_norm = divNorm_gray(g,k,sigma,rot);

% % g_norm(g_norm<1.2) = 0;
% % figure; imagesc(max(g_norm(:,:,:,1),[],3));axis image;axis off;



% %% energy response
g_energy = sqrt(sum(g_norm.^2,4));
g_energy(g_energy<1.5) = 0;
figure; imagesc(max(g_energy,[],3));axis image;axis off;
