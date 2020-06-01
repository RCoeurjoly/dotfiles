#!/bin/bash
REPOS_TO_SYNC="Exocortex \
               LLPSI \
               Metatron"

for repo_to_sync in ${REPOS_TO_SYNC};
do
    git config --bool branch.master.sync true
    git config --bool branch.master.syncNewFiles true
    cd ~/${repo_to_sync}
    ~/git-sync/git-sync
done
