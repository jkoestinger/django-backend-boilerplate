from rest_framework import serializers
from django.contrib.auth import get_user_model

from api.models import Post, Comment

User = get_user_model()


class UserBaseSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = User
        fields = [
            'url',
            'id',
            'first_name',
            'last_name',
            'username',
            'email'
        ]


class PostBaseSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Post
        fields = [
            'url',
            'id',
            'created_at',
            'updated_at',
            'content',
            'author'
        ]


class CommentBaseSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Comment

        class Meta:
            model = Post
            fields = [
                'url',
                'id',
                'created_at',
                'updated_at',
                'content',
                'post',
                'author'
            ]
