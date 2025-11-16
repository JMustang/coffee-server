package controllers

import (
	"net/http"

	"github.com/JMustang/coffee-server/helpers"
	"github.com/JMustang/coffee-server/services"
)

var coffee services.Coffee

func GetAllCoffees(w http.ResponseWriter, r *http.Request) {

	all, err := coffee.GetAllCoffees()
	if err != nil {
		helpers.MessageLogs.ErrorLog.Println(err)
		return
	}
	helpers.WriteJSON(w, http.StatusOK, helpers.Envelope{"coffees": all})
}
