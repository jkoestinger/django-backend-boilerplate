from rest_framework import permissions
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.viewsets import ReadOnlyModelViewSet
from rest_framework_extensions.mixins import NestedViewSetMixin
# from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from django.contrib.auth import get_user_model

from api.models import Post, Comment
from api.serializers import UserBaseSerializer, PostBaseSerializer, CommentBaseSerializer

User = get_user_model()


class UserViewSet(NestedViewSetMixin, ReadOnlyModelViewSet):

    queryset = User.objects.all()
    serializer_class = UserBaseSerializer


class PostViewSet(NestedViewSetMixin, ReadOnlyModelViewSet):
    model = Post
    queryset = Post.objects.all()
    serializer_class = PostBaseSerializer


class CommentViewSet(NestedViewSetMixin, ReadOnlyModelViewSet):
    model = Comment
    queryset = Post.objects.all()
    serializer_class = CommentBaseSerializer


class UserSelfView(APIView):
    permission_classes = (permissions.IsAuthenticated,)

    def get(self, request, format=None):
        serializer = UserBaseSerializer(request.user, context={'request': request})
        return Response(serializer.data)
