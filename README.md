# Cronsporter

## Comment l'utiliser

Par défaut, l'image planifie une tâche toutes les minutes en invoquant le script `/data/work/task.sh`

### Spécifier la répétition
L'image cherche le pattern dans la variable d'environnement `PATTERN`

### Changer la tâche
Monter un volume contenant un fichier `task.sh` dans `/data/work`

## Une note sur transporter

Cette image est basée sur un fork de transporter prenant en compte la dernière version d'elasticsearch
