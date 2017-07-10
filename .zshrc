#!/bin/zsh
## .zshrc for  in /Users/reeb
##
## Made by Vincent Cuissard
## Mail    <vincent.cuissard@gmail.com>
##
## Started on  Tue Jun  3 22:21:06 2003 Vincent Cuissard
## Last update Mon Jul 20 10:23:39 2009 Vincent Cuissard
##


ZSH_VERSION_TYPE=old
if [[ $ZSH_VERSION == 3.1.<6->* ||
	    $ZSH_VERSION == 3.2.<->*  ||
	    $ZSH_VERSION == 4.<->* ||
        $ZSH_VERSION == 5.<->* ]]
then
    if which zstyle > /dev/null ; then
	ZSH_VERSION_TYPE=new
    fi
fi

zshrc_load_status () {
    #echo -n "\r.zshrc load: $* ... \e[0K"
}

zshrc_load_status Environnement
if [ -f ~/.zsh/env ] ; then
    source ~/.zsh/env
fi

zshrc_load_status Environnement local
if [ -f ~/.zsh/${HOSTNAME}.zsh ] ; then
    source ~/.zsh/${HOSTNAME}.zsh
fi

zshrc_load_status Alias
if [ -f ~/.zsh/alias ] ; then
    source ~/.zsh/alias
fi

zshrc_load_status Fonctions
if [ -f ~/.zsh/fonctions ] ; then
    source ~/.zsh/fonctions
fi

if [[ "$ZSH_VERSION_TYPE" == 'new' ]] ; then
    if [ -f ~/.zsh/complet.new ] ; then
	  source ~/.zsh/complet.new
    fi
elif [ -f ~/.zsh/complet ] ; then
    source ~/.zsh/complet
fi

zshrc_load_status Terminal
if [ -f ~/.zsh/term ] ; then
    source ~/.zsh/term
fi
umask 022
echo -n '\r'
 if [ -f /sw/bin/figlet -a ! -z "$HOST" ] ; then
     /sw/bin/figlet $HOST
 fi
 if [ -z "$nocolor" ] ; then # make default color
     c2
 else PS1="%n@%m %~ %% "
     export PS1
 fi



 PATH=$PATH":/usr/local/bin:/usr/local/sbin:$HOME/bin"
 export PATH

 c6

 [ -f $HOME/.ssh/setup ] && . $HOME/.ssh/setup

zshrc_load_status  Options setopt  \
        all_export \
        always_last_prompt \
     NO_always_to_end \
        append_history \
        auto_list \
        auto_menu \
     NO_auto_name_dirs \
        auto_param_keys \
        auto_param_slash \
        auto_pushd \
        auto_remove_slash \
     NO_auto_resume \
        bad_pattern \
        bang_hist \
     NO_beep \
        bg_nice \
        brace_ccl \
        correct_all \
     NO_bsd_echo \
        cdable_vars \
     NO_chase_links \
        clobber \
        complete_aliases \
        complete_in_word \
        correct \
        correct_all \
        csh_junkie_history \
     NO_csh_junkie_loops \
     NO_csh_junkie_quotes \
     NO_csh_null_glob \
        equals \
        extended_glob \
        extended_history \
        function_argzero \
        glob \
     NO_glob_assign \
        glob_complete \
        glob_dots \
        glob_subst \
        hash_cmds \
        hash_dirs \
        hash_list_all \
     NO_hist_allow_clobber \
     NO_hist_beep \
        hist_ignore_dups \
        hist_ignore_space \
     NO_hist_no_store \
        hist_verify \
     NO_hup \
     NO_ignore_braces \
     NO_ignore_eof \
        interactive_comments \
     NO_list_ambiguous \
     NO_list_beep \
        list_types \
        long_list_jobs \
        magic_equal_subst \
     NO_mail_warning \
     NO_mark_dirs \
     NO_menu_complete \
        multios \
     NO_nomatch \
        notify \
     NO_null_glob \
        numeric_glob_sort \
     NO_overstrike \
        path_dirs \
        posix_builtins \
     NO_print_exit_value \
     NO_prompt_cr \
        prompt_subst \
        pushd_ignore_dups \
        pushd_minus \
     NO_pushd_silent \
        pushd_to_home \
        rc_expand_param \
     NO_rc_quotes \
     NO_rm_star_silent \
     NO_sh_file_expansion \
        sh_option_letters \
        short_loops \
        sh_word_split \
     NO_single_line_zle \
     NO_sun_keyboard_hack \ unset \
     NO_verbose \
     NO_xtrace \
        auto_cd \
        zle


setopt auto_cd
setopt auto_pushd
setopt SH_WORD_SPLIT

export EMAIL="vincent.cuissard@gmail.com"
export EDITOR=emacs

# Add SSH Key
SSH_ADD_OPT=
if [ `uname` = "Darwin" ]; then
    SSH_ADD_OPT="-K"
fi
ssh-add $SSH_ADD_OPT
