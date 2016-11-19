function Spq = ReadReal(FileName,Rows,Cols)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% Read real files without header                                                             %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% INPUT:                                                                                    %
%   - FileName:                  Filename of the input file to read (e.g.:
%                                'T11.bin'. Remember that with this function
%                                we are reading the REAL elements which are
%                                T11, T22 and T33 in the case of a coherence mtx. 'T'.
% OUTPUT:                                                                                   %
%   - Spq:                       Reshaped matrix from the FileName file.
%                                       (rows x cols)
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example
% T11 = ReadReal('T11',256,256)
% This reads 'T11.bin' and saves it back in matrix form in 'T11'.
% Note that this process is repeated for the 3 real elements of the
% coherence matrix 'T', which are: T11,T22 and T33.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Versions:                                                                                          %
% 14/10/16: Ferran Pérez Gamonal: Added some helpful comments and hints for new users.
% © Carlos Lopez-Martinez                                                                   %
% 04/2010, RSLab, TSC, UPC, Barcelona, SPAIN                                                %
% 07/2011, RSLab, TSC, UPC, Barcelona, SPAIN                                                %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Open a new file with filename 'FileName' and read it with float 32
% format:
fl   = fopen(FileName,'rb','l');
Mtx  = fread(fl,[Rows*Cols],'float');
fclose(fl);

% Reshape it back to matrix form.
% From dim: 1x(rows x cols) back to : dim: rows x cols
Spq = reshape(Mtx,Rows,Cols);