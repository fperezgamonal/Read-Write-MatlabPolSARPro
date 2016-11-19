function Spq = ReadSLC(FileName,Rows,Cols)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% Read SLC files without header                                                             %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% © Carlos Lopez-Martinez                                                                   %
% 04/2010, RSLab, TSC, UPC, Barcelona, SPAIN                                                %
% 07/2011, RSLab, TSC, UPC, Barcelona, SPAIN                                                %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fl   = fopen(FileName,'rb','l');
Mtx  = fread(fl,[2 Rows*Cols],'float');
fclose(fl);

Spq = reshape(Mtx(1,:),Rows,Cols)+j.*reshape(Mtx(2,:),Rows,Cols);
