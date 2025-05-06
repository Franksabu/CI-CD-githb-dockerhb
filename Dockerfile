# Utilisez une image de base Python officielle
FROM python:3.10

# Désactiver la mise en mémoire tampon pour une sortie immédiate
ENV PYTHONUNBUFFERED 1

# Install system dependencies
RUN apt-get update && apt-get install -y gcc musl-dev

# Upgrade pip
RUN pip install --upgrade pip
# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez les fichiers de dépendances (requirements.txt)
COPY ./requirements.txt .

# Installez les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiez le code source de l'application
COPY . .

# Définissez les variables d'environnement (si nécessaire)
# ENV DJANGO_SETTINGS_MODULE=myproject.settings

# Exposez le port sur lequel votre application Django écoute
EXPOSE 8000

# Commande pour lancer l'application Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]