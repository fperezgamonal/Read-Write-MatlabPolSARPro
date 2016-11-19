function [T11,T12,T13,T22,T23,T33] = Read_Alberto(FileName)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% Read Alberto's files                                                                      %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% © Carlos Lopez-Martinez                                                                   %
% 05/2009, RSLab, TSC, UPC, Barcelona, SPAIN                                                %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fl   = fopen(FileName,'rb','b');
Rows = fread(fl,1,'int');
Cols = fread(fl,1,'int');
Mtx  = fread(fl,9*Rows*Cols,'float');
fclose(fl);

T11 = reshape(Mtx(1:9:9*Rows*Cols),Rows,Cols).';
T12 = reshape(Mtx(2:9:9*Rows*Cols),Rows,Cols).'+j.*reshape(Mtx(3:9:9*Rows*Cols),Rows,Cols).';
T13 = reshape(Mtx(4:9:9*Rows*Cols),Rows,Cols).'+j.*reshape(Mtx(5:9:9*Rows*Cols),Rows,Cols).';
T22 = reshape(Mtx(6:9:9*Rows*Cols),Rows,Cols).';
T23 = reshape(Mtx(7:9:9*Rows*Cols),Rows,Cols).'+j.*reshape(Mtx(8:9:9*Rows*Cols),Rows,Cols).';
T33 = reshape(Mtx(9:9:9*Rows*Cols),Rows,Cols).';

mkdir('./T3');

SaveSAR_real_nocaption(fliplr(rot90(T11,-1)),Rows,Cols,'./T3/T11.bin');
SaveSAR_real_nocaption(fliplr(rot90(real(T12),-1)),Rows,Cols,'./T3/T12_real.bin');
SaveSAR_real_nocaption(fliplr(rot90(imag(T12),-1)),Rows,Cols,'./T3/T12_imag.bin');
SaveSAR_real_nocaption(fliplr(rot90(real(T13),-1)),Rows,Cols,'./T3/T13_real.bin');
SaveSAR_real_nocaption(fliplr(rot90(imag(T13),-1)),Rows,Cols,'./T3/T13_imag.bin');
SaveSAR_real_nocaption(fliplr(rot90(T22,-1)),Rows,Cols,'./T3/T22.bin');
SaveSAR_real_nocaption(fliplr(rot90(real(T23),-1)),Rows,Cols,'./T3/T23_real.bin');
SaveSAR_real_nocaption(fliplr(rot90(imag(T23),-1)),Rows,Cols,'./T3/T23_imag.bin');
SaveSAR_real_nocaption(fliplr(rot90(T33,-1)),Rows,Cols,'./T3/T33.bin');
fclose all;

fl  = fopen('./T3/config.txt','wt');
fprintf(fl,'%s\n','Nrow');
fprintf(fl,'%s\n',num2str(Rows));
fprintf(fl,'%s\n','---------');
fprintf(fl,'%s\n','Ncol');
fprintf(fl,'%s\n',num2str(Cols));
fprintf(fl,'%s\n','---------');
fprintf(fl,'%s\n','PolarCase');
fprintf(fl,'%s\n','monostatic');
fprintf(fl,'%s\n','---------');
fprintf(fl,'%s\n','PolarType');
fprintf(fl,'%s\n','full');
fclose(fl);
