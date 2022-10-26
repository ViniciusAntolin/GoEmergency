
<div align="center" style="display: inline_block"><br>
 <img align="center" src="https://github.com/GabrielMorettii/GoEmergency/blob/master/github/assets/logo.png" alt="logo">
</div>

## ⁉ What's GoEmergency ?

GoEmergency is a project that aims to help people make better decisions about
what to do when they have certain symptoms, but it in no way replaces the help of a qualified healthcare professional.

It was initially created in 2020 as a course conclusion work on how telemedicine can help 
in a chaotic environment as it was at the beginning of the coronavirus pandemic.

## 👀 Overview 

![Preview-Screens](https://github.com/GabrielMorettii/GoEmergency/blob/master/github/assets/preview.jpg)

If you want to take a look on all application's screens or the project demonstration, they are here [here](https://drive.google.com/drive/folders/)

## 🏗 Class Diagram

The system targets clinics in general. Each patient will have personal information registered such as CPF, e-mail, password, etc; being that each one will carry out consultations of diseases of the symptoms that he is feeling, being able to carry out several consultations. Each doctor will be registered as a person and also with their specialty and CRM. Each patient can open one or more chats with specialist doctors and each doctor can chat with one or more patients.

<div align="center" style="display: inline_block"><br>
 <img  align="center" width="80%" height="500" src="https://github.com/GabrielMorettii/GoEmergency/blob/master/github/assets/diagram.png">
</div>

## 🕴️ Actors

The "GoEmergency" system has as main actors: Patient, Doctor and Administrator, who inherit from Actor Pessoa, who is responsible for carrying the attributes in common among the other actors.

<div align="center" style="display: inline_block"><br>
 <img  align="center" src="https://github.com/GabrielMorettii/GoEmergency/blob/master/github/assets/actors.png">
</div>



## 📌 Project requeriments

All application business rules for the Admin actor can be found in this diagram. I just put this one up to exemplify what it's like for other actors.

<div align="center" style="display: inline_block"><br>
 <img  align="center" src="https://github.com/GabrielMorettii/GoEmergency/blob/master/github/assets/adm-usecases.png">
</div>

## 💻 Enviroment Setup <a name="enviroment-setup" />:

```
# Application

## Clone this repository

$ git clone https://github.com/GabrielMorettii/GoEmergency.git

## Open the IDE (Netbeans or Eclipse)
## Go to open project and select the cloned project through the system directory:
## Click on the hammer & broom icon (Clean & Build)
## Run the application
## The server is running at port 8080 (http://localhost:8080/)

# Databasse

## Clone this repository

$ git clone https://github.com/GabrielMorettii/GoEmergency.git

## Create a database named "goemergency"
## Put on the password 123123
## Restore the backup "backup.bak" file found in this project folder

```

## 🔧 Built With

- [Java Web](https://docs.oracle.com/javase/8/docs/technotes/guides/javaws) - For dynamic web pages 
- [CSS](https://www.w3schools.com/css/) - For styling sheets
- [Javascript](https://www.javascript.com/) - DOM Manipulation
- [postgreSQL](https://www.postgresql.org/) - Relational Database
- [MD5](https://www.md5hashgenerator.com/) - For password-hashing
- [Mailtrap](https://mailtrap.io/) - Email Sandbox Service
- [Google Translate](https://translate.google.com/) - Translation service 
- [Via Cep](https://viacep.com.br/) - CEP Query service 
- [Dark Reader](https://darkreader.org/) - Theme switch service 
- [SQL Server](https://www.microsoft.com/pt-br/sql-server/) - Relational Database


## 🧰 Support tools

- [Discord](https://discord.com/) - Communication Service
- [Microsoft Teams](https://mailtrap.io/) - Communication & Planning Service
- [GitHub](https://github.com/GabrielMorettii/GoEmergency) - Public Repository Service
- [Git](https://git-scm.com/) - Version Control Service
- [Astah](https://astah.net/) - UML Modeling Tool

## 🧐 Contributing

You can send how many PR's do you want, I'll be glad to analyse and accept them! And if you have any question about the project...

Email-me: gabrielmorettisilva@gmail.com

Connect with me at [LinkedIn](https://www.linkedin.com/in/gabriel-morettii/)

Thank you!

## 🔑 License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/GabrielMorettii/GoEmergency/blob/master/LICENSE) file for details.
