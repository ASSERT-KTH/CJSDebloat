
 #!/bin/sh
# dirs=(./Data/*/)
# echo $dirs
# cd $dirs
# echo `pwd`


# # Shell to get git url by package name.
# path='top3000_new.txt'
# cat $path | while read rows
# do
# echo $rows
# node get-package-github-url.js $rows
# done

# Shell to git clone and npm install
# path='top43_url.txt'
# cat $path | while read rows
# do
# array=(${rows//,/ })
# package=${array[0]}
# url=${array[1]}

# cd Original
# git clone $url
# cd $package
# npm install
# cyclonedx-npm --output-format JSON --output-file npmlist.json
# nyc npm run test > top43_nyc.log
# #empty devDependencies
# # npm install
# # cyclonedx-npm --output-format JSON --output-file npmlist_runtime.json
# cd ../..
# folderPath='Original/'$package
# echo $folderPath
# # node parseDependencies.js $folderPath
# done


# # Shell to git clone and parse package.json
# # 1. fetch package name
# # 2. collect git url
# # 2.1 remove duplicated url (packages)
# # 3. revise package name (folder name)
# # 4. git clone and parse package.json
# # 5. record production packages and development packages from the package.jsons
# path='top250_1361_folder.txt'
# cat $path | while read rows
# do
#     echo $rows
#     cd Original
#     array=(${rows//,/ })
#     folder=${array[0]}
#     url=${array[1]}
#     git clone $url
#     cd $folder
#     # cat /dev/null > developmentDependencies.json
#     commitID=$(git rev-parse --short HEAD 2>&1)
#     str=$folder","$url","$commitID
#     echo $str >> ../../top250_1361_commit.txt
#     npm install
#     # timeout -k 10s 5m nyc npm run test >> ../../originalTests.log
#     npm list --json --omit=dev --depth=10 >> productionDependencies.json
#     npm list --json --include=dev >> developmentDependencies.json
#     python3 ../../collectRepoUrl.py $folder
#     cd ../..
#     # python3 parseJson.py $folder
# done

# # Looply Check if there is node_modules and package.json under each package
# path='top1361_folder_commit.txt'
# x=0
# cat $path | while read rows
# do
#     cd ./Original
#     array=(${rows//,/ })
#     folder=${array[0]}
#     cd $folder
#     # if [ ! -d "/node_modules" ]; then
#     if [ ! -f "package.json" ]; then
#         echo $rows >> ../../top_valid_folder_commit.txt
#         x=$(( x+1 ))
#         echo $x
#         cd ../../
#         rm -rf $folder
#     fi
#     # fi
#     if [ -f "package.json" ]; then
#         echo $rows
#         echo "have package.json"
#         cd ../..
#     fi
#     if [ -d "/node_modules" ]; then
#         echo $rows
#         break
#     fi
    
#     echo $x
# done

# path='top_dependencies_greater1.txt'
# # path='top5_test.txt'
# m=5
# n=90
# cat $path | while read rows
# do
#     # cd Original
#     array=(${rows//,/ })
#     # folder=${array[0]}
#     total=${array[4]}
#     if [ $total -ge $m ];then
#         if [ $total -le $n ];then
#         # str=$total","
#         # echo -n $str >> top_dependencies_temp.txt
#             echo $rows >> top_blabla.txt
#         fi
#     fi
#     # cd $folder
#     # echo `pwd`
#     # calculate the number of direct dependencies, transitive dependencies and total dependencies.
#     # str=$total","
#     # echo -n $str >> top_dependencies_temp.txt
#     # echo $str >> top_dependencies_temp.txt
#     # python3 ../../collectRepoUrl.py $folder
#     # cd ../..
# done

# path='top_491_for_nyc_collection.txt'
# # path='top5_test.txt'

# cat $path | while read rows
# do
#     cd Original
#     array=(${rows//,/ })
#     folder=${array[0]}
#     cd $folder
#     # echo `pwd`
#     # calculate the number of direct dependencies, transitive dependencies and total dependencies.
#     # str=$folder","$url","$commitID
#     # echo $str >> ../../top_number_dependencies.txt
#     echo `pwd`
#     echo "I am package "$folder
#     echo "I am package "$folder >> /dev/stderr
#     nyc npm run test
#     cd ../..
# done

# re-calculate total dependencies
path='top_30_improved.txt'
cat $path | while read rows
do
    echo "I am package "$rows" ....."
    # python3 collectDependentFiles.py $rows
    echo "I am package "$rows" ....." >> /dev/stderr
    # cd Data
    cd VariantsPureDep
    # array=(${rows//,/ })
    # folder=${array[0]}
    # cd $folder
    cd $rows
    # cat /dev/null > "Data/"$rows"/"$rows"_bloated_functions.txt"
    # cd mininode_fine
    # echo "I am running "$rows" in mininode_fine"
    # echo "I am running "$rows" in mininode_fine" >> /dev/stderr
    # npm run test
    # cd ..
    # cd mininode_coarse
    # echo "I am running "$rows" in mininode_coarse"
    # echo "I am running "$rows" in mininode_coarse" >> /dev/stderr
    # npm run test
    cd variant_deps 
    cd $rows
    npm run test
    # npm list --all --omit=dev --json >> productionDependenciesNew.json
    # python3 ../../collectRepoUrl.py $folder
    cd ../../../..
    # python3 parseJson.py $folder
    # python3 readDepTree.py $rows
    # python3 collectRepoUrl.py $rows
    # sh countfunctions.sh $rows
    # sh removefunctions.sh $rows
    # rm -rf "Data/"$rows"/"$rows"_deps_bloated_transitive_level.txt"
    # rm -rf "Data/"$rows"/"$rows"_bloated_files_not_on_the_tree.txt"
    # filePath="Data/"$rows"/"$rows"_deps_bloated_level_with_leaf.txt"
    # if [ -f $filePath ] 
    # then
    #     cat $filePath >> collection_bloated_level_with_leaf.txt
    # fi

done