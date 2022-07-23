const Discord = require('discord.js');
const mySqlConnector = require('../MySqlConnector');

/**
 * @param {Discord.Client} client
 * @param {Discord.Message} message
 * @param {Array<String>} arguments
 */
module.exports.run = async(client, message, arguments) => {

    let sportName = arguments;

    let sports = await mySqlConnector.executeQuery("SELECT * FROM sports WHERE sport_name = '" + sportName + "'");
    let athlete = await mySqlConnector.executeQuery("SELECT * FROM athletes WHERE id = '" + sports[0].athlete_1 + "' OR id = '" + sports[0].athlete_2 + "' OR id ='"+ sports[0].athlete_3 + "'");
    
    
    await message.channel.send(`En ${sportName} le podium est le suivant: 
    1- ${athlete[0].athlete_name}: ${athlete[0].country}
    2- ${athlete[1].athlete_name}: ${athlete[1].country}
    3- ${athlete[2].athlete_name}: ${athlete[2].country}`);
};

module.exports.name = 'sports'