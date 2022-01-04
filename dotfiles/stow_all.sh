 #fd -t  d | xargs stow -t $HOME	
 #fd -t  d |  xargs -I {} sh -c "basename {} | stow -t $HOME"
 fd -t  d |  xargs -I {} sh -c 'export stowmod=$(basename {}) && stow -t $HOME -S $stowmod'
