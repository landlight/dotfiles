function start_ssh_agent() {
    eval "$(ssh-agent -s)"
}

function setup_ssh_key() {
    read -p 'Email: ' email
    read -p 'File Name Suffix (id_rsa_*): ' fileSuffix
    if [ -z "$fileSuffix" ]
        then
            echo "File Name Suffix was undefined"
        else
            local fileName=id_rsa_$fileSuffix
            local filePath=$HOME/.ssh/$fileName
            ssh-keygen -t rsa -b 4096 -C "$email" -N "" -f $HOME/.ssh/$fileName
            echo "ssh key created in $filePath"
            echo "Starting SSH Agent"
            start_ssh_agent
            echo "Adding ssh key $fileName to SSH Agent"
            ssh-add $filePath
            copy_ssh_key $fileName.pub
    fi
}

function copy_ssh_key() {
    if [ -z $1 ]
        then
            read -p "File Name:" fileName
        else
            local fileName=$1
    fi
    if [ -z $fileName ]
        then
            echo "File Name is required."
        else
            local filePath=$HOME/.ssh/$fileName
            cat $filePath | pbcopy
            echo "$filePath contents added to clipboard"
    fi
}

function remove_ssh_key() {
    read -p 'File Name: ' fileName
    if [ -z $fileName ]
        then
            echo "File ame is required."
        else
            local filePath=$HOME/.ssh/$fileName
            start_ssh_agent
            ssh-add -d $filePath
            rm $filePath
            rm $filePath.pub
    fi
}