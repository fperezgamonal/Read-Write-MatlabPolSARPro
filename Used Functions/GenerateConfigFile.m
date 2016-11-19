function GenerateConfigFile(folderName,Rows, Cols)
% GenerateConfigFile(Rows, Cols): Generates a config.txt file for
% the matrix T with nº of rows = rows and nº of columns = cols.
% It creates a folder with the name folderName in the directory where
% datasets to be analysed will be kept (in PolSAR Pro -compatible bin format(float 32)).
%
% File's structure:
%
%   Nrow
%   256             %Just an example.
%   ---------
%   Ncol
%   256             %Just an example.
%   ---------
%   PolarCase
%   monostatic
%   ---------
%   PolarType
%   full
%
%
% Important note:
% In order for PolSAR Pro to correctly read our binary files, this config
% file must be added to the same folder where all binary files are stored.
%
% Author
% Ferran Pérez Gamonal. All credits go to Alberto González for writting the
% code. I only added helpful comments and an input parameter 'folder_name'
% to customize the directory inside the fixed .\Datasets route 
% (build on the current folder 'pwd').
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Create the full directory.
filename = fullfile([pwd '\Datasets' folderName],'config.txt'); % '.\Datasets\Folder_name\config.txt'
fl  = fopen(filename,'wt');
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