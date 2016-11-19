function [Spq,Rows,Cols] = ReadSAR_RealComplex_Caption(FileName,Rows,Cols)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% Read Complex binary files like: T12_real.bin and T12_imag.bin                                                                     %
%                                                                                           %
%                                                                                           %
% INPUT:                                                                                    %
%   - FileName:                  Filename of the pair of input files to read (e.g.:
%                                'T12_real.bin' and 'T12_imag.bin' for T12.
%                                Remember that with this function we are reading the
%                                COMPLEX elements which are T12, T13 and T23
%                                in the case of a coherence mtx. 'T'.
% OUTPUT:                                                                                   %
%   - Spq:                       Reshaped matrix from the FileName_imag.bin
%                                and FileName_real.bin files.
%                                Both with dim: (rows x cols)
%                                                             
% Example
% [T12,256,256] = ReadSAR_RealComplex_Caption('T12',256,256)
% This reads 'T12_real.bin' and 'T12_imag.bin' and saves it back in matrix
% form in 'T12'. Note that this process is repeated for the 3 unique
% complex elements of the coherence matrix 'T', which are: T12,T13 and T23.
%
% Note: 
% Although in the title the word 'Caption' is included, the
% statements to create a header in this binary file are commented.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Versions:                                                                                          %
% 14/10/16: Ferran Pérez Gamonal: Added some helpful comments and hints for new users.
% © Carlos Lopez-Martinez                                                                   %
% 04/2010, RSLab, TSC, UPC, Barcelona, SPAIN                                                %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Reads real part
fl   = fopen(strcat(FileName,'_real.bin'),'rb','l');
%Rows = fread(fl,1,'int');
%Cols = fread(fl,1,'int');
MtxReal  = fread(fl,[Rows*Cols],'float32');
disp(strcat('Reads real part:',FileName,'_real.bin ',num2str(Rows),' rows x ',num2str(Cols), 'cols ...'));
fclose(fl);

% Reads imaginary part
fl   = fopen(strcat(FileName,'_imag.bin'),'rb','l');
%Rows = fread(fl,1,'int');
%Cols = fread(fl,1,'int');
MtxImag  = fread(fl,[Rows*Cols],'float32');
disp(strcat('Reads imaginary part:',FileName,'_imag.bin ',num2str(Rows),' rows x ',num2str(Cols), 'cols ...'));
fclose(fl);

Spq = reshape(MtxReal,Rows,Cols)+j.*reshape(MtxImag,Rows,Cols);