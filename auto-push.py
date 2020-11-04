import os
message = input('What did you do dude? :')
os.system('git add .')
os.system(f'git commit -m "{message}"')
os.system('git push origin master')
os.system('echo Ready Dude 😎')
