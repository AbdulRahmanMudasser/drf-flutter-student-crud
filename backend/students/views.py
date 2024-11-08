from django.shortcuts import render
from rest_framework.decorators import api_view
from .serializers import StudentSerializer
from rest_framework.response import Response
from rest_framework import status
from .models import StudentModel

# Create New Student
@api_view(['POST'])
def create_student(request):
    serializer = StudentSerializer(data=request.data)

    if serializer.is_valid():
        serializer.save()

        return Response(serializer.data, status=status.HTTP_201_CREATED)
    
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# Get Specific Student Details
@api_view(['GET'])
def student_details(request, pk):
    try:
        student = StudentModel.objects.get(pk=pk)

    except StudentModel.DoesNotExist:
        return Response('{"error": "Student Not Exits"}', status=status.HTTP_404_NOT_FOUND)
    
    serializer = StudentSerializer(student)

    return Response(serializer.data, status=status.HTTP_200_OK)

# Get All Student Details
@api_view(['GET'])
def list_students(request):
    students = StudentModel.objects.all()

    serializer = StudentSerializer(students, many=True)

    return Response(serializer.data, status=status.HTTP_200_OK)

# Update Existing's Student Data
@api_view(['PUT'])
def update_student(request, pk):
    try: 
        student = StudentModel.objects.get(pk=pk)
    except StudentModel.DoesNotExist:
        return Response('{"error": "Student Not Exits"}', status=status.HTTP_404_NOT_FOUND)
    
    serializer = StudentSerializer(data=request.data)

    if serializer.is_valid():
        serializer.save()

        return Response(serializer.data, status=status.HTTP_200_OK)
    
    return Response(serializer.errors, status=status.HTTP_404_NOT_FOUND)

# Deleting Student
@api_view(['DELETE'])
def delete_student(request, pk):
    try:
        student = StudentModel.objects.get(pk=pk)
    except StudentModel.DoesNotExist:
        return Response('{"error": "Student Not Exists"}', status=status.HTTP_404_NOT_FOUND)
    
    student.delete()

    return Response('{"message": "Student Deleted"}', status=status.HTTP_204_NO_CONTENT)
