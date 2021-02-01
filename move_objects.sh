#Debugging
set -ex

#ENV VARS
repoPath=$(repoPath)
destinityPath=$(destinityPath)
processedPath=$(processedPath)

echo "---------------------------------------------------------"
echo "        INICIANDO COPIA DE ARCHIVOS A CARGAR             "
echo "---------------------------------------------------------"

cd $destinityPath
ls $repoPath/
cp $repoPath/*.zip .
unzip packa*.zip


while read LINE ; do
        if [ "$LINE" == "" ]
                then
           echo -e "\n\nLinea Vacia"
        else
            ARCHIVO=$(basename "$LINE")
            RUTA=$(dirname "$LINE")
            echo $ARCHIVO
            echo $RUTA
            cp -av "$destinityPath/$LINE" /$RUTA/"$ARCHIVO"
            echo "Linea copiada OK:" $LINE
        fi
done < package.txt

cd $destinityPath
echo "---------------------------------------------------------"
echo "       MOVIENDO PAQUETES A PROCESADOS                    "
echo "---------------------------------------------------------"
mv package*.zip $processedPath
echo "---------------------------------------------------------"
echo "       LIMPIANDO EL DIRECTORIO DESTINO                   "
echo "---------------------------------------------------------"
rm -rf *