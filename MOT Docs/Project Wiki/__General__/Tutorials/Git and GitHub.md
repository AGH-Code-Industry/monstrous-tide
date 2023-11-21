___

> If you are new to our team, there are a few things to get straight - those regard working with [[Links|tools we use]]. If you have any trouble with Obsidian, check out our Discord or contact anyone of *Zespół Totalnej Porażki*, we will help!

~~*It is long, but just a little bit, trust me.*~~

*GitHub* is a service utilizing Git - a version control system, which provides our team with insight into code story, with possibility of dividing our work and many more.

# How you can use it

You can use Git through:
- GitHub website - which is *very* problematic to work with, just skip to next point; 
- through desktop applications with convenient UI, such as [GitHub Desktop](https://desktop.github.com/), [GitKraken](https://www.gitkraken.com/) (which is free for AGH students!) or more;
- through command line in your OS.

Excluding GitHub's website, you need to[^1] install Git system to your device. This is an exemplary [guide](https://github.com/git-guides/install-git), of course there are many others to help you.
# At the very beginning

1. After you create your account and send your username to the *Code Industry* leaders, you should be added to *AGH-Code-Industry* organisation and to *Zespół Totalnej Porażki* - our team.
2. Then you should be able to find our repository - a kind of remote storage where we keep our code and which controls all the change history and branches. Its name is *monstrous-tide*.

# A few terms

It may seem confusing right now, but after you read this and [[Git and GitHub#Actual work|this]], it should be clear:

- **Merging** means copying progress from one branch to another, without losing anything. For example, if you *merge* branch **master** (which holds currently considered main source code) into branch *A*, it copies *master* into *A*, but also keeps everything *A* held before. It forces you to resolve conflicts, if any occur!
- A **branch** is an independent workspace. You may *merge* some code into it from another branch (especially from *master* branch) and upgrade it. Remember, branches may differ!
	- Branches are held remotely - they are not *only* on your device, hence many people may work on them. 
		- The thing is, the work you do is initially held on your device. If you do a piece of work, you should *add* them (*git add .* or *git add -a*), so your next *commit* may be able to save the changes
		- A **commit** is an update of your work on current branch. You do it by *git commit* and then enter your *commit message*, which shall concisely describe your work. After that your changes on the branch shall be saved... locally.
		- To save changes remotely, on the remote repo itself, you should **push** the changes to the branch. Just it - *git push*[^2] is like a "save on the remote repo" button. All your *commits* are then visible on the Git repository.
	- We open separate branches to progress with separate tasks. Usually there is one person per branch, but naturally there is no rule to it.
	- After your task is completed and *pull request* (see below) is accepted, you shall close this branch and let it rest.
- A **pull request (PR)** is a action you start after finishing your task. 
	1. When you decide your work over a task is done, you should open a PR from the branch you worked, which is actually equal to stating: *"Hey, I did my work, I think it's okay. It should land on master branch"*.
	2. After that, someone should *review* the PR - check if everything is correct and if it does not conflict with current progress on *master*. If so, they let you know - you may receive a negative feedback or just comments under the PR with no approving review.
	3. If your code receives a positive review, everything is good to go - you may close the pull request, which makes *master* branch copy work you have done to itself. Then you should close the branch you made PR from.

# Actual work

When you go through some task, it usually looks like this:
1. You get the task from [[Trello]] and open a new *branch*;
2. You *merge* *master* branch into it, to have current progress in it;
3. You do the magic and write your code, which you *commit* and *push* to the branch, to save your progress safely and remotely;
4. You also write documentation for your code in Obsidian ([[Main canvas.canvas|check this out]]);
5. When you are finished, you open a *pull request*, correct everything if needed;
6. Then, after approval, you close the *PR* ***and*** the branch you created for this task;
7. You embrace engulfing happiness after completing the task.


[^1]: 99.999% sure, confirmation needed tho.
[^2]: If you use it directly in CMD/CLI, the syntax may be problematic, read up on that before playing.