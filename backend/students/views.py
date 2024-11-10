from django.shortcuts import render, get_object_or_404
from rest_framework.decorators import api_view
from .serializers import StudentSerializer
from rest_framework.response import Response
from rest_framework import status
from .models import StudentModel
from rest_framework.views import APIView

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
        return Response({"error": "Student Not Exits"}, status=status.HTTP_404_NOT_FOUND)
    
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
        return Response({"error": "Student Not Exits"}, status=status.HTTP_404_NOT_FOUND)
    
    # Full Update
    # serializer = StudentSerializer(student, data=request.data)

    # Partial Update
    serializer = StudentSerializer(student, data=request.data, partial=True)

    if serializer.is_valid():
        serializer.save()

        return Response(serializer.data, status=status.HTTP_200_OK)
    
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# Deleting Student
@api_view(['DELETE'])
def delete_student(request, pk):
    try:
        student = StudentModel.objects.get(pk=pk)
    except StudentModel.DoesNotExist:
        return Response({"error": "Student Not Exists"}, status=status.HTTP_404_NOT_FOUND)
    
    student.delete()

    return Response({"message": "Student Deleted"}, status=status.HTTP_200_OK)

# Create New Student
class CreateStudent(APIView):
    def post(self, request):
        serializer = StudentSerializer(data=request.data)

        if serializer.is_valid(raise_exception=True):
            serializer.save()

            return Response(serializer.data, status=status.HTTP_201_CREATED)
        
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# Get Student Detail    
class StudentDetail(APIView):
    def get(self, request, pk):
        student = get_object_or_404(StudentModel, pk=pk)

        serializer = StudentSerializer(student)

        return Response(serializer.data, status=status.HTTP_200_OK)
    
# Get Student List
class ListStudents(APIView):
    def get(self, request):
        students = StudentModel.objects.all()

        serializer = StudentSerializer(students, many=True)

        return Response(serializer.data, status=status.HTTP_200_OK)
    
# Update Student
class UpdateStudent(APIView):
    def put(self, request, pk):
        student = get_object_or_404(StudentModel, pk=pk)

        serializer = StudentSerializer(student, data=request.data, partial=True)

        if serializer.is_valid():
            serializer.save()

            return Response(serializer.data, status=status.HTTP_200_OK)
        
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
# Delete Student
class DeleteStudent(APIView):
    def delete(self, request, pk):
        student = get_object_or_404(StudentModel, pk=pk)

        student.delete()

        return Response({"Message": "Student Deleted"}, status=status.HTTP_200_OK)
