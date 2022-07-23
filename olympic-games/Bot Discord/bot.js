require('dotenv').config();

const Discord = require('discord.js');
const commandLoader = require('./commandLoader');
const mySqlConnector = require('./MySqlConnector.js');

mySqlConnector.connect();

const TOKEN = 'OTk5OTc0NjE1MjI3MDUyMDcz.GQJB6G.Ff77XEh0RP54fFz5HJpzqUgFYII6ePKvFn-9P8';

const bot = new Discord.Client( {
    intents: ['GUILD_MESSAGES', 'GUILDS', 'GUILD_MEMBERS']
});

const PREFIX = '$';

commandLoader.load(bot);

bot.on('messageCreate', async(message) => {

    if(message.content.startsWith(PREFIX)) {
        let words = message.content.split(' ');
        const commandName = words.shift().slice(1);
        const arguments = words;

        if (bot.commands.has(commandName)) {
            // La commande existe, on la lance
            bot.commands.get(commandName).run(bot, message, arguments);
          } else {
            // La commande n'existe pas, on prévient l'utilisateur
            await message.delete();
            await message.channel.send(`The ${commandName} does not exist.`);
          }
    }
});

bot.login(TOKEN)
    .then(() => {
        console.log("connexion réussie");
    }).catch(error => {
        console.error(error);
    });