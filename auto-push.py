import os
message = input('Nombre del commit y descripcion:')
os.system('git add .')
os.system(f'git commit -m "{message}"')
os.system('git push origin master')
os.system('Ready 😎')
