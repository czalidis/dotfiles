alias master_local='export ROS_MASTER_URI=http://localhost:11311'
alias master_robot='export ROS_MASTER_URI=http://pandora-gears:11311'
alias master_lab='export ROS_MASTER_URI=http://pandora-lab:11311'

alias compiler_gcc='export CC=gcc && export CXX=g++'
alias compiler_clang='export CC=clang && export CXX=clang++'

alias grep-in-files='grep -hHIrFn'

alias tar-gz='tar czf'
alias tar-bz2='tar cjf'

alias untar-gz='tar xzf'
alias untar-bz2='tar xjf'

alias regvim='gvim --remote-silent'
alias vimr='vim --remote-silent'

alias rosdep-install='rosdep install --from-paths src --ignore-src --rosdistro $ROS_DISTRO'
