#!/bin/bash

# Clone all github.com repositories for a specified user.

if [ -z $1 ] || [ ! -z "$2" ]; then
    echo
    echo "Usage: $0 <user_name>"
    exit 1;
fi

USER=$1

# clone all repositories for user specifed
# for repo in `curl -s https://api.github.com/users/$USER/repos?per_page=1000 | grep "git_url" | awk '{print $2}'| sed 's/"\(.*\)",/\1/'`; do
# for repo in `curl -s https://api.github.com/users/$USER/repos?per_page=1000 | grep "git_url" | awk '{print $2}' | sed "s/\"git:\/\//https:\/\//g" | sed "s/\",//g"`; do
# for repo in `curl -s https://api.github.com/users/$USER/repos?per_page=1000 | grep "clone_url" | awk '{print $2}' | grep -oP '(?<=").*(?=")'`; do
    # echo $repo
    # git clone $repo;
# done;


bufResp=`curl -s https://api.github.com/users/$USER/repos?per_page=1000`
vSedGitUserLink="https:\/\/github.com\/$USER\/"
bufRepoNames=`echo "$bufResp" | grep "clone_url" | awk '{print $2}' | sed "s/$vSedGitUserLink//g" | grep -oP '(?<=").*(?=.git")'`
# echo "$bufRepoNames"

# arrRepolink=()
# # for repo in `echo "$bufResp" | grep "git_url" | awk '{print $2}' | grep -oP '(?<=").*(?=")'`; do
# # for repo in `echo "$bufResp" | grep "git_url" | awk '{print $2}' | sed "s/\"git:\/\//https:\/\//g" | sed "s/\",//g"`; do
# for repo in `echo "$bufResp" | grep "clone_url" | awk '{print $2}' | grep -oP '(?<=").*(?=")'`; do
#     arrRepolink+=($repo)
# done;
# arrRepoLen=${#arrRepolink[*]}

# echo ${arrRepolink[*]}
# echo $arrRepoLen

arrReponame=()
for reponame in `echo "$bufRepoNames"`; do
    # echo $reponame
    arrReponame+=($reponame)
done
arrRepoLen=${#arrReponame[*]}
# echo ${arrReponame[*]}
# echo $arrRepoLen

arrBranch=()
for defaultBranch in `echo "$bufResp" | grep "default_branch" | awk '{print $2}' | grep -oP '(?<=").*(?=")'`; do
    # echo $defaultBranch
    arrBranch+=($defaultBranch)
done;
arrBranchLen=${#arrBranch[*]}
# echo ${arrBranch[*]}
# echo $arrBranchLen

# if [ "$arrRepoLen" != "$arrBranchLen" ]; then
if [ "$arrRepoLen" != "$arrBranchLen" ]; then
    echo "Repositories lenght dont match with default branch lenght"
    exit 1
fi

arrRepoLen_m1=$(($arrRepoLen - 1))
for i in $(seq 0 $arrRepoLen_m1); do
    echo "Downloading... ${arrReponame[$i]} - ${arrBranch[$i]}"
    # echo "${arrRepolink[$i]} - ${arrBranch[$i]}"
    
    # echo "curl -s -L https://github.com/$USER/${arrReponame[$i]}/archive/refs/heads/${arrBranch[$i]}.zip -o ${arrReponame[$i]}_${arrBranch[$i]}.zip"
    # curl -s -L https://github.com/$USER/${arrReponame[$i]}/archive/refs/heads/${arrBranch[$i]}.zip -o ${arrReponame[$i]}_${arrBranch[$i]}.zip
    # curl -L https://github.com/$USER/${arrReponame[$i]}/archive/refs/heads/${arrBranch[$i]}.zip -o ${arrReponame[$i]}_${arrBranch[$i]}.zip
    
    curl -L https://github.com/$USER/${arrReponame[$i]}/archive/master.zip -o ${arrReponame[$i]}_master.zip
done

exit 0
