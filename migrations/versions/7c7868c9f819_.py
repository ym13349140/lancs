"""empty message

Revision ID: 7c7868c9f819
Revises: 8baba7458425
Create Date: 2017-03-04 16:27:54.463000

"""

# revision identifiers, used by Alembic.
revision = '7c7868c9f819'
down_revision = '8baba7458425'

from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

def upgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('conferences', 'user_id',
               existing_type=mysql.INTEGER(display_width=11),
               nullable=True)
    op.add_column('users', sa.Column('description', sa.String(length=128), nullable=True))
    ### end Alembic commands ###


def downgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('users', 'description')
    op.alter_column('conferences', 'user_id',
               existing_type=mysql.INTEGER(display_width=11),
               nullable=False)
    ### end Alembic commands ###