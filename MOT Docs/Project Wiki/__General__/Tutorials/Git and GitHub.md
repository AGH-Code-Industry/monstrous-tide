___

> If you are new to our team, there are a few things to get straight - those regard working with [[Links|tools we use]]. If you have any trouble with Obsidian, check out our Discord or contact anyone of *Zespół Totalnej Porażki*, we will help!

*GitHub* is a service utilizing Git - a version control system, which provides our team with insight into code story, with possibility of dividing our work and many more.

# How you can use it

You can use Git through:
- GitHub website; 
- through desktop applications with convenient UI, such as [GitHub Desktop](https://desktop.github.com/), [GitKraken](https://www.gitkraken.com/) (which is free for AGH students!) or more;
- through command line in your OS.

Excluding GitHub's website, you need to[^1] install Git system to your device. This is an exemplary [guide](https://github.com/git-guides/install-git), of course there are many others to help you.
# At the very beginning

1. After you create your account, you should be added to *AGH-Code-Industry* organisation and to *Zespół Totalnej Porażki* - our team.
2. Then you should be able to find our repository - a kind of remote storage where we keep our code and which controls all the change history and branches. Its name is *monstrous-tide*.

# A few terms

- **Merging** means copying progress from one branch to another, without losing anything. For example, if you *merge* branch **master** (which holds currently considered main source code) into branch *A*, it copies *master* into *A*, but also keeps everything *A* held before. It will force you to resolve conflicts, if any occur!
- A **branch** is an independent workspace. You may *merge* some code into it from another branch (especially from *master* branch) and upgrade it. Remember, branches may differ and sometimes you may need to resolve them!
	- Branches are held remotely - they are not *only* on your device, hence many people may work on them.
	- We open separate branches to progress with separate tasks. Usually there is one person per branch, but naturally there is no rule to it.
	- After your task is completed and *pull request* (see below) is accepted, you shall close this branch and let it rest.
- A **pull request (PR)** is a action you start after finishing your task. 
	1. When you decide your work over a task is done, you should open a PR from the branch you worked, which is actually equal to stating: *"Hey, I did my work, I think it's okay. It should land on master branch"*.
	2. After that someone should *review* the PR - check if everything is correct and if it does not conflict with current progress on *master*. If not, they will let you know - you may receive a negative feedback or just comments with no approving review.
	3. If your code received a positive review, everything is good to go - you may close the pull request, which will make *master* branch copy work you have done to itself. Then you should close the branch you made PR from.

# Actual work

When you go through some task, it usually looks like this:
1. You get the task from [[Trello]] and open a new *branch*;
2. You *merge* *master* branch into it, to have current progress in it;
3. You do the magic and write your code;
4. You write documentation for your code in Obsidian ([[Main canvas.canvas|check this out]]);
5. You open a *pull request*, correct everything if needed, then close the PR ***and*** the branch you started for this task;
6. You embrace engulfing happiness after completing the task.


[^1]: 99.999% sure, confirmation needed tho.