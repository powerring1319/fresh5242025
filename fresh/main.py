import uvicorn

def run():
    uvicorn.run("fresh.thiss:app", host="0.0.0.0", port=10000)
