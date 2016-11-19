function SaveSAR_complex(Cxy,Lines,Rows,FileName)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% Saves 2 binary files in the format: [Lines,Rows,Real Data_Binary]                         %
%                                     [Lines,Rows,Imag Data_Binary]                         %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% INPUT:                                                                                    %
%   - Cxy:                  Complex matrix corresponding to a complex
%                           channel. In the case of a coherence matrix 'T',
%                           this would be: T12, T13 and T23
% OUTPUT:                                                                                   %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% © Carlos Lopez-Martinez                                                                   %
% 05/2009, RSLab, TSC, UPC, Barcelona, SPAIN                                                %
%                                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[f_real,mess] = fopen(strcat(FileName,'_real.bin'),'wb');
if f_real == -1 error(mess); end

[f_imag,mess] = fopen(strcat(FileName,'_imag.bin'),'wb');
if f_imag == -1 error(mess); end

RPart = reshape(real(Cxy),1,Lines*Rows);
IPart = reshape(imag(Cxy),1,Lines*Rows);
RPart = reshape(RPart,1,Lines*Rows);
IPart = reshape(IPart,1,Lines*Rows);

Count = fwrite(f_real,RPart,'float');
if Count ~= Lines*Rows,
    error('Error writing file...');
end
fclose(f_real);

Count = fwrite(f_imag,IPart,'float');
if Count ~= Lines*Rows,
    error('Error writing file...');
end
fclose(f_imag);
