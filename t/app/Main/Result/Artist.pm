package t::app::Main::Result::Artist;
use base qw/DBIx::Class::Core/;
__PACKAGE__->table('artist');
__PACKAGE__->add_columns(
    "id",
    { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
    "name",
    {   data_type     => "varchar",
        default_value => "",
        is_nullable   => 0,
        size          => 255
    });
__PACKAGE__->set_primary_key('id');

__PACKAGE__->load_components(qw/ Result::ExternalAttribute Result::ColumnData /);
__PACKAGE__->init_external_attribute(
    artist_attribute =>
      't::app::Main::Result::ArtistAttribute',
    'artist_id'
);
__PACKAGE__->register_relationships_column_data();

1;
