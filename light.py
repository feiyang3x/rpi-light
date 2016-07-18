#coding='utf8'
from bottle import error, route, static_file, debug, run, request, response, template, TEMPLATE_PATH, PasteServer
#from gevent import monkey; monkey.patch_all()
#from time import sleep
import RPi.GPIO as GPIO

GPIO_OUT = 12
def light_init():
    GPIO.setmode(GPIO.BOARD)
    GPIO.setup(GPIO_OUT, GPIO.OUT)

debug(True)
TEMPLATE_PATH.insert(0, './')

@error(403)
def mistake403(code):
  return 'The parameter you passed has the wrong format!'

@error(404)
def mistake404(code):
  return 'Sorry, this page does not exist!'

@route('/stat/<filepath:path>')
def static(filepath):   
    return static_file(filepath, root='./stat/')

@route('/')
def light_html():   
    return template('light')

@route('/light')
def light_ctrl():
    light_init()
    num = request.query.number
    if (num == "1"):
        try:
            GPIO.output(GPIO_OUT, GPIO.HIGH)
            state = "Power ON"
        except KeyboardInterrupt:
            GPIO.cleanup()
    else:
        try:
            GPIO.output(GPIO_OUT, GPIO.LOW)
            state = "Power OFF"
        except KeyboardInterrupt:
            GPIO.cleanup()
    return state


#run(host='0.0.0.0', port=80, server='gevent')
run(host='0.0.0.0', port=80)
