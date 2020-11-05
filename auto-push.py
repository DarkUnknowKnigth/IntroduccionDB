import os
message = input('What did you do?, dude 🙃🎤 :')
branch = input('What branch? DUDE 🤨:')
os.system('git add .')
os.system(f'git commit -m "{message}"')
os.system(f'git push origin {branch}')
os.system('echo Ready!!! Dude 😎')
