from rest_framework import serializers
from .models import StudentModel

# Custom Validators
def validate_city(value):
    if value.lower() not in ["rahim yar khan", "lahore", "karachi", "islamabad", "gujranwala", "rajanpur"]:
        raise serializers.ValidationError(f"{value} Is Not a Valid City")
    
    return value

# def validate_name(value):
#     if value[0].lower() != "r":
#         raise serializers.ValidationError("Name Should Start With r")
    
#     return value

class StudentSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    name = serializers.CharField(max_length=100)
    roll = serializers.IntegerField()
    city = serializers.CharField(max_length=100, validators=[validate_city])

    def create(self, validated_data):
        return StudentModel.objects.create(**validated_data)
    
    def update(self, instance, validated_data):
        instance.name = validated_data.get('name', instance.name)
        instance.roll = validated_data.get('roll', instance.roll)
        instance.city = validated_data.get('city', instance.city)

        instance.save()

        return instance
    
    # Field Level Validation
    def validate_roll(self, value):
        if value >= 200:
            raise serializers.ValidationError("Seat Full")
        
        return value
    
    # Object Level Validation
    def validate(self, data):
        if data['name'].lower() == data['city'].lower():
            raise serializers.ValidationError("Name & City Cannot Be Same")
        
        return data
