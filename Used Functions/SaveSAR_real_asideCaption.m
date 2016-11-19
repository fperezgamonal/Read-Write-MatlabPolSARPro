function SaveSAR_real_asideCaption(Cxx,Lines,Rows,FileName)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% Saves a binary file in the format: [Lines,Rows,Data_Binary]                               %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% INPUT:                                                                                    %
%   - Cxx :         The REAL covariance or coherence matrix of the i-th channel.
%                   This means, for a coherence T3 matrix, the channels :
%                   1,4 and 6; also known as T11, T22 and T33. Note that
%                   there will be 1 file per REAL matrix element, hence,
%                   this function must be called 3 times to generate a
%                   complete set of the 3 real components of the coherence
%                   matrix 'T'.
%    
%   - Lines :       Number of columns in Cxx
%   - Rows :        Number of rows in Cxx
%   - FileName :    Name of the output file, e.g.: for the T11 element (1st
%                   power band), 'T11.bin'.
%
% OUTPUT:           None.                                                                                   %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% See also:
%
% Versions:
% 14/10/16: This file was rewritten by Ferran Pérez Gamonal to add some
% helpful comments about its use and also reformat it to write the raw
% binary file without any header in it. The header is included in a
% separated file (hence the addition of "asideCaption" to the functions title).
%                                                                                           %
% Author                                                                   
% © Carlos Lopez-Martinez                                                                   %
% 05/2009, RSLab, TSC, UPC, Barcelona, SPAIN                                                %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Open a new binary file with the name "FileName" and check for error
% messages.
[f,mess] = fopen(FileName,'wb');
if f == -1 
    error(mess);
end
% Reshape the matrix to a row vector of 1x(Lines*rows) dimensions.
RPart = reshape(Cxx,1,Lines*Rows);

% In the original file, here the header would be printed. In our case this
% is done separately with the function "GenerateConfigFile.m'.

% Write in float (32 bits by default) and count the nº of written data to
% debug any problems.
Count = fwrite(f,RPart,'float');
if Count ~= Lines*Rows
    error('Error writing file...');
end

fclose(f);
