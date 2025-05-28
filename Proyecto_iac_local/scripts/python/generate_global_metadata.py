import json
import uuid

def main():
    result = {
        "deployment_id": str(uuid.uuid4()),
    }
    print(json.dumps(result))

if __name__ == "__main__":
    main()