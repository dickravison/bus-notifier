# bus-notifier

This is a python script to send a Telegram notification in the morning and afternoon of up to date bus departure times for a given journey. This uses uses the Transport for Greater Manchester live bus timetables for data. The python script expects 4 variables

`HOMETOWORK`
`WORKTOHOME`
`TELEGRAM_CHAT_ID`
`TELEGRAM_TOKEN`

as environment variables. The `HOMETOWORK` and `WORKTOHOME` variables expect a URL for the bus stop to provide data on for each journey, these can be found at https://tfgm.com/public-transport/bus. 

It will check the current time and if it is before midday, it will provide the data for the home to work journey. If it is after midday, it will provide the data for the work to home journey. This function will be packaged into Lambda and invoked by an Eventbridge rule which can be configured using the Terraform in `tf/`
