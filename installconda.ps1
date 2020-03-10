param(
#[Parameter(Mandatory=$True)]
[string]
$storageAccountName
)


#*********************************************************************************************************************************
#Script body                                                                                                                    **
#Execution beins here                                                                                                           **
#*********************************************************************************************************************************


$owershipFile = 'https://' + $storageAccountName +'.blob.core.windows.net/scripts/Ownership-Prediction.yml'
$pipReqFile = 'https://' + $storageAccountName +'.blob.core.windows.net/scripts/pip-requirements.txt'

azcopy copy $owershipFile 'C:\Ownership-Prediction.yml'

azcopy copy $pipReqFile 'C:\pip-requirements.txt'


#Comandos para descargar e instalar repo de conda

conda env create --name Ownership-Prediction -f C:\Ownership-Prediction.yml

C:\Miniconda\envs\Ownership-Prediction\python.exe -m pip install -r C:\pip-requirements.txt
