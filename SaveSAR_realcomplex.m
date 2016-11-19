function SaveSAR_realcomplex(Cxy,Lines,Rows,FileName)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                           %
% Saves a binary file in the format: [Lines,Rows,Inteleaced Real and Imag of Data_Binary]   %
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

% [f_real,mess] = fopen(strcat(FileName,'.bin'),'wb');
% if f_real == -1 error(mess); end

Cxy = [reshape(real(Cxy),1,Lines*Rows); reshape(imag(Cxy),1,Lines*Rows)];
Cxy = reshape(Cxy,1,2*Lines*Rows);

% % Header with dimensions
% Count = fwrite(f_real,Lines,'int32');
% if Count ~= 1,
%     error('Error writing file...');
% end
% Count = fwrite(f_real,Rows,'int32');
% if Count ~= 1,
%     error('Error writing file...');
% end
% 
% % Data
% Count = fwrite(f_real,Cxy,'float');
% if Count ~= 2*Lines*Rows,
%     error('Error writing file...');
% end

fclose(f_real);
