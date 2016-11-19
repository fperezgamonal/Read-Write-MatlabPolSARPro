function [Spq,Rows,Cols] = Read_SLC_Caption(FileName)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% Read Alberto's files                                                                      %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% © Carlos Lopez-Martinez                                                                   %
% 04/2010, RSLab, TSC, UPC, Barcelona, SPAIN                                                %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fl   = fopen(FileName,'rb','b');
Rows = fread(fl,1,'int');
Cols = fread(fl,1,'int');
Mtx  = fread(fl,[2 Rows*Cols],'float');
fclose(fl);

Spq = reshape(Mtx(1,:),Rows,Cols)+j.*reshape(Mtx(2,:),Rows,Cols);
