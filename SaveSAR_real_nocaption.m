function SaveSAR_real_nocaption(Cxx,Lines,Rows,FileName)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% Saves a binary file in the format: [Lines,Rows,Data_Binary]                               %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% INPUT:                                                                                    %
% OUTPUT:                                                                                   %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% © Carlos Lopez-Martinez                                                                   %
% 05/2009, RSLab, TSC, UPC, Barcelona, SPAIN                                                %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[f,mess] = fopen(FileName,'wb');
if f == -1 error(mess); end
RPart = reshape(Cxx,1,Lines*Rows);

% Count = fwrite(f,Lines,'int32');
% if Count ~= 1,
%     error('Error writing file...');
% end
% Count = fwrite(f,Rows,'int32');
% if Count ~= 1,
%     error('Error writing file...');
% end

Count = fwrite(f,RPart,'float');
if Count ~= Lines*Rows,
    error('Error writing file...');
end

fclose(f);