class AddTriggerToTableCategory < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
        CREATE OR REPLACE FUNCTION public.trg_categories_fn()
          RETURNS trigger
          LANGUAGE 'plpgsql'
          COST 100
          VOLATILE NOT LEAKPROOF
          AS $$
          begin
            IF NEW.name = 'Tech' THEN
              NEW.priority = 1;
            END IF;
            IF NEW.name = 'Business' THEN
              NEW.priority = 2;
            END IF;
            IF NEW.name = 'Food' THEN
              NEW.priority = 3;
            END IF;
            IF NEW.name = 'Wildlife' THEN
              NEW.priority = 4;
            END IF;
            return new;
          end
          $$;
        CREATE TRIGGER trg_category
            BEFORE INSERT ON public.categories
            FOR EACH ROW
            EXECUTE PROCEDURE public.trg_categories_fn();
        SQL
      end
      dir.down do
        execute <<-SQL
          DROP TRIGGER trg_category ON public.categories;
          DROP FUNCTION public.trg_categories_fn();
        SQL
      end
    end
  end
end
